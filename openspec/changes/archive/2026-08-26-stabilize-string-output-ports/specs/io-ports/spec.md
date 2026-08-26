## MODIFIED Requirements

### Requirement: Textual output ports over files and strings

The language SHALL provide `open-output-file`, which opens a named file for textual output, and
`open-output-string` together with `get-output-string`, which accumulate written characters and
return them as a string. Both SHALL return a port satisfying `output-port?`.

A string output port SHALL preserve its accumulated text for its lifetime regardless of other
ports opened or closed after it. Internal storage growth caused by later ports MUST NOT lose,
corrupt, or redirect its output and MUST NOT terminate the process.

`flush-output-port` SHALL make any buffered output of a port visible to other readers of its
destination; `close-port` SHALL flush before closing. Output written to a file port SHALL be
complete and readable once the port is closed.

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
