---
name: csharp-style
description: Use when authoring C# code.
---

- Always use `var`, except when initializing to the default value: use `Type? name = null;` instead of `var name = default(Type);`.
- Prefer short type names with `using` directives; add missing usings. Use fully qualified names _only_ when the short name would be ambiguous or resolve to a different type.
- Do not suffix method names with `Async`, including methods marked `async` or returning `Task` or `ValueTask`. Preserve names required by interfaces or overrides.
- Use per-file `using` directives for namespaces defined in project code, never import them with `global using`. Framework package namespaces such as Microsoft.Extensions.\*, System.\* or logging package namespaces _should_ use `global using` when shared across many files, living only in `GlobalUsings.cs`.
- Never use primary constructors, except in positional records.
- Always prefer async disposal if the class implements `IAsyncDisposable`. `await using` / `DisposeAsync()` instead of `using` / `Dispose()`. When using `ConfigureAwait(false)` with `IAsyncDisposable`, use `{name}Scope` for the variable name: `var stream = CreateStream(); await using var streamScope = stream.ConfigureAwait(false);`.
- Prefer instance classes that implement interfaces and are injected into consumers over static methods. Static methods are only appropriate for small, stateless utility functions with no external dependencies.
