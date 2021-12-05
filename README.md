# dixon.xyz

The code for my personal site, built with Hugo, AWS, and Docker.

This was a quick weekend project to update my existing site.

# Todo

- Infra to setup s3 bucket
- 

## Technologies Used
- [Hugo](https://gohugo.io/)
- [Docsy](https://www.docsy.dev/)
- [hugo-embed-pdf-shortcode](https://github.com/anvithks/hugo-embed-pdf-shortcode/blob/master/layouts/shortcodes/embed-pdf.html)
- Docker
- AWS

## Dev

```bash
docker run --rm -it -v $(pwd):/src -p 1313:1313 klakegg/hugo:0.83.1-ext-alpine shell
```

## Deploy

