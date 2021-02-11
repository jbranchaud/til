# Re-Export An Imported Type

I have a TypeScript module that is defining an XState machine. Among other
things, it imports the `DoneEventObject` type from `xstate`. I want to
re-export that type so that any modules using this machine have access to that
type definition.

This can be done a couple of ways. One way to import it under an aliased name
and then assign + export it using the original name.

```typescript
import {Machine, DoneEventObject as _DoneEventObject} from 'xstate'

export type DoneEventObject = _DoneEventObject
```

This works, but adds some potential indirection and confusion through the
double assignment.

Another way of doing this is to reference the type off the import statement as
part of an assignment.

```typescript
import {Machine} from 'xstate'

export type DoneEventObject = import('xstate').DoneEventObject
```

This imports, assigns, and exports the type in a single statement.

[source](https://github.com/microsoft/TypeScript/issues/28481#issuecomment-552938424)
