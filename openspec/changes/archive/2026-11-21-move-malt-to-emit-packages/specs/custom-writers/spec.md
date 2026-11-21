# Spec Delta

## MODIFIED Requirements

### Requirement: Custom writers survive separate compilation

Writers SHALL be ordinary Scheme closures able to capture library state. Source-driven compilation, whole-library artifacts, cached native libraries, JIT forms, and standalone linking SHALL retain equivalent registration and callback behavior. Programs that do not import a writer-registering library SHALL NOT require that library's code or any library-specific runtime recognition.

#### Scenario: A compiled library owns its writer

- **WHEN** a separately compiled library registers a writer capturing a private formatting setting and a later REPL form prints its value
- **THEN** the callback resolves and uses that captured setting just as in a standalone executable
