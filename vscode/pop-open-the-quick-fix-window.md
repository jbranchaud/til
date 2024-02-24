# Pop Open The Quick Fix Window

Often when I see a red squiggly in VS Code, it is because I'm missing an import
for entity in my code. I have a couple options.

1. I could scroll to the top of the file and manually add the import to my list
   of imports.
2. I can mouse over the offending function to see the error, carefully mouse
   over to _Quick Fix_ link, and get at the quick fix list that way.

There is a better third way.

Once my cursor (not the just the mouse pointer) is on the offending item, I can
hit `Cmd+.`. That directly pops open the Quick Fix window with focus on the
first item in that window. I can navigate to the fix I want and hit enter.

Another thing to keep in mind. As you're typing out an un-imported entity, if
VS Code knows about it, it will show it as an auto-complete option with the
package it comes from. If you tab-out the one you want, not only will it fill
in the rest of the entity name, but it will also auto-add the import at the top
of your file.
