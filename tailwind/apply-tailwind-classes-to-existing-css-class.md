# Apply Tailwind Classes To Existing CSS Class

Let's say I have some HTML in my app that I don't totally control -- maybe it's
a 3rd-party component or it was rendered by a markdown transformer. Regardless,
I am ending up with some HTML where tags have class names that I'd like to
style.

```html
<div class="code-block">
  <!-- ... -->
</div>
```

If it was HTML (or JSX) that I was writing, I could stick whatever tailwind
class names I wanted on the various tags to get the styling just right. But
since I don't control it directly, I have to find another way to _apply_ those
tailwind classes.

Enter [tailwind's `@apply`
directive](https://tailwindcss.com/docs/functions-and-directives#apply). With
this, I can target an existing class selector with any tailwind utility classes.
Add lines like the following to your root `tailwind.css` file.

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

/* additional styling here 👇 */
.code-block {
  @apply bg-gray-200 rounded-md p-4;
}
```
