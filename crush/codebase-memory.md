<!-- codebase-memory-mcp:start -->
# Codebase Memory for Crush

Route work as Scout (fast provisional lookup), Verify (default task-directed verification), or Auditor (bounded full graph verification). Use `search_graph`, `trace_path`, and `get_code_snippet` in the parent agent. After candidate paths are known, the parent must call `check_index_coverage` once for all evidence paths and add relevant scopes for negative or exhaustive claims. Read/grep every reported partial, skipped, excluded, stale, pending, or unknown range or scope.
Before starting a task subagent, include the tier, graph project, generation/freshness, bounded scope, queries and pagination state, qualified symbols, paths, caller/callee findings, coverage ranges/reasons, source fallback already performed, and unresolved questions.
The task agent does not inherit MCP access and must not call or claim MCP access. It should treat the handoff as its structural starting point and use read/grep for exact source verification, especially every missed-coverage range.
<!-- codebase-memory-mcp:end -->
