# Spec Delta

## Purpose

Defines recoverable frontend diagnostics that identify malformed and unsupported expression and definition forms without exposing compiler-internal pair-access failures.

## ADDED Requirements

### Requirement: Invalid frontend forms name the offending syntax

The frontend SHALL validate the structure of recognized expression, binding, definition, and transformer forms before destructuring them. Rejection SHALL identify the offending form and the malformed shape or unsupported feature through a frontend diagnostic, rather than an internal accessor failure or signal. Batch commands SHALL fail with nonzero status and a diagnostic on stderr.

#### Scenario: A malformed local syntax binding is identified

- **WHEN** `let-syntax` or `letrec-syntax` receives an improper binding list, a binding without a transformer, duplicate keywords, or an invalid `syntax-rules` transformer
- **THEN** compilation reports the relevant form and structural problem without `car: not a pair`, `cdr: not a pair`, or a signal

#### Scenario: Unsupported dotted define-values is identified

- **WHEN** the frontend receives `(define-values (x y . z) (values 1 2 3 4))`
- **THEN** it reports `define-values` and its unsupported dotted binding shape, without an internal accessor error

#### Scenario: Existing case-lambda support remains valid

- **WHEN** an imported `case-lambda` contains an earlier dotted clause accepting one or more arguments and later clauses, or a rest-only clause
- **THEN** valid calls continue to select the first matching clause and compile successfully
- **AND** malformed clauses produce a frontend diagnostic identifying `case-lambda`, rather than an internal accessor error

#### Scenario: Local recursive syntax is accepted

- **WHEN** the `letrec-syntax` reproduction from issue #91 supplies a valid `syntax-rules` transformer and body
- **THEN** it expands and evaluates as local recursive syntax instead of reporting an unsupported form or an accessor failure

### Requirement: Frontend rejection preserves interactive usability

A malformed or unsupported form submitted to the REPL SHALL report its frontend error and leave the session available for subsequent input. Rejected input SHALL NOT publish partial definitions, transformer bindings, or import bindings. Equivalent source on different compilation paths SHALL identify the same offending form and reason.

#### Scenario: The REPL accepts input after rejection

- **WHEN** a session receives malformed local syntax or unsupported dotted `define-values`, then evaluates `(+ 1 2)`
- **THEN** it reports the first form's diagnostic, returns `3` for the next form, and retains earlier valid bindings

#### Scenario: Batch and interactive diagnostics agree

- **WHEN** the same malformed binding or transformer is compiled by Chez, `emit run`, `emit build`, `emit lib` in a library body, and `emit repl`
- **THEN** each diagnostic names the same syntax and rejection reason, allowing host-specific location and presentation differences
