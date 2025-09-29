# Disable And Enable A Button

With TailwindCSS we can take a couple different approaches to tie the visual
and functional interactivity of a button to another elements state using
classes.

One approach is to use
[`peer`](https://tailwindcss.com/docs/hover-focus-and-other-states#styling-based-on-sibling-state)
and `peer-checked:<class>`.

```html
<div>
  <input
    type="checkbox"
    id="peer-enable"
    class="w-5 h-5 cursor-pointer peer"
  />
  <label
    for="peer-enable"
    class="cursor-pointer text-slate-700 font-medium"
  >
    I agree to the terms and conditions
  </label>
  <button
    class="opacity-40 pointer-events-none grayscale cursor-not-allowed peer-checked:opacity-100 peer-checked:pointer-events-auto peer-checked:grayscale-0 peer-checked:cursor-pointer"
  >
    Peer Submit
  </button>
</div>
```

Classes to make to button appear disabled (e.g. `opacity-40`) as well as
functional classes that affect interactivity (e.g. `pointer-events-none`) are
applied by default. When the sibling checkbox gets checked, the inverted
classes take effect making the button enabled.

The `peer` approach works, but lacks flexibility. As soon as I need to make any
structural changes to the HTML that sever the peer (i.e. sibling) relationship
of the checkbox and the button, those classes stop working.

With
[`group`](https://tailwindcss.com/docs/hover-focus-and-other-states#styling-based-on-the-descendants-of-a-group)
and `group-has-[:checked]:<class>`, I can style the button relative to another
group member as long as everything is nested under some shared group tag.

```html
<div class="group">
  <div class="flex items-center gap-3">
    <input
      type="checkbox"
      id="group-enable"
      class="w-5 h-5 cursor-pointer"
    />
    <label
      for="group-enable"
      class="cursor-pointer text-slate-700 font-medium"
    >
      I agree to the terms and conditions
    </label>
  </div>
  <button
    class="opacity-40 pointer-events-none grayscale cursor-not-allowed group-has-[:checked]:opacity-100 group-has-[:checked]:pointer-events-auto group-has-[:checked]:grayscale-0 group-has-[:checked]:cursor-pointer"
  >
    Group Submit
  </button>
</div>
```

We can even utilize [named
groups](https://tailwindcss.com/docs/hover-focus-and-other-states#differentiating-nested-groups)
if we have overlapping and conflicting group interactions. But I won't get into
that here.
