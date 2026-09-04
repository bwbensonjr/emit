## MODIFIED Requirements

### Requirement: Textual output ports over files and strings

The language SHALL provide `open-output-file`, which opens a named file for textual output, and
`open-output-string` together with `get-output-string`, which accumulate written characters and
return them as a string. Both SHALL return a port satisfying `output-port?`.

A string output port SHALL preserve its accumulated text for its lifetime regardless of other
ports opened or closed after it. Internal storage growth caused by later ports MUST NOT lose,
corrupt, or redirect its output and MUST NOT terminate the process.

The cost of opening a string output port SHALL NOT depend on how many output ports are already
open. A program that opens string ports and does not close them SHALL NOT pay a cost that grows
with the number it has already opened. Closing a port is an optional act of hygiene, never a
requirement for a program to scale: a program that legitimately retains many open string ports
SHALL behave the same as one that closes each in turn.

A string output port's accumulated storage SHALL be a single allocation per port, sized by the
text written to that port, and SHALL NOT require a second per-port allocation to hold its
bookkeeping. An implementation MAY retain that storage for the lifetime of the process: a port
record names its storage only through a runtime handle, so the reachability of the port is not
observable to whatever owns the storage, and reclaiming it early is therefore not required here.

`flush-output-port` SHALL make any buffered output of a port visible to other readers of its
destination; `close-port` SHALL flush before closing. Output written to a file port SHALL be
complete and readable once the port is closed. `get-output-string` SHALL return the accumulated
text whether or not the port has been closed.

#### Scenario: A file written can be read back

- **WHEN** a program opens an output file port, writes text to it, closes it, then opens an input
  port on the same path and reads the contents
- **THEN** the text read back equals the text written

#### Scenario: A string port accumulates what was written

- **WHEN** a program opens an output string port, writes `"ab"` and then the character `c` to it,
  and calls `get-output-string`
- **THEN** the result is `"abc"`

#### Scenario: A retained string port survives later port growth

- **WHEN** a program retains a string output port, opens enough additional output ports to grow
  the implementation's internal port storage, writes `"captured"` to the retained port, and calls
  `get-output-string` on it
- **THEN** the result is `"captured"` and the program exits normally

#### Scenario: Opening string ports costs the same whether or not they are closed

- **WHEN** a program opens many thousands of string output ports, writing to each and taking its
  text, and does not close any of them
- **THEN** its running time is within a small constant factor of the same program closing each
  port after use
- **AND** its running time grows linearly, not quadratically, with the number of ports opened

#### Scenario: The accumulated text survives closing the port

- **WHEN** a program writes to a string output port, closes it, and then calls
  `get-output-string` on it
- **THEN** the result is the text that was written

#### Scenario: Text written to a string port is not truncated by its length

- **WHEN** a program writes text far larger than any initial internal buffer to a string output
  port and calls `get-output-string`
- **THEN** the result is exactly the text written, of exactly the expected length
