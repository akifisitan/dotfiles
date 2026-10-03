---
name: csharp-style
description: Use when authoring C# code.
---

- Always use `var`, except when initializing to the default value: use `Type? name = null;` instead of `var name = default(Type);`
- Prefer short type names with `using` directives; add missing usings. Fully qualify only when needed to avoid ambiguity or preserve meaning
- Do not suffix method names with `Async`, including methods marked `async` or returning `Task` or `ValueTask`. Preserve names required by interfaces or overrides
- Use per-file using directives for namespaces defined in this repository, never import them with global using. Framework and third-party package namespaces may use global using when shared across many files
