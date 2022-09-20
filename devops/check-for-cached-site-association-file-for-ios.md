# Check For Cached Site Assocation File For iOS

Apple caches your [AASA (Apple App Site
Association)](https://developer.apple.com/documentation/Xcode/supporting-associated-domains)
file periodically. This is used for signaling what site URLs should be Univeral
Links to your iOS app.

You can view the contents of the cached site association file by inserting your
domain into the end of this URL --
`https://app-site-association.cdn-apple.com/a/v1/[domain]`.

For instance, if my app's domain is `www.my-app.com`, then I'd pull up
`https://app-site-association.cdn-apple.com/a/v1/www.my-app.com` to see what is
cached.

Additionally, you can run your site association file through a validator by
entering your domain into the form at [AASA
Validator](https://branch.io/resources/aasa-validator/).

[source](https://david.y4ng.fr/implementing-and-testing-universal-links/)
