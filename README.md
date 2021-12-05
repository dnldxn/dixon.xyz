# dixon.xyz

The code for my personal site, built with Hugo, AWS, and Docker.

This was a quick weekend project to update my existing site.

## Technologies Used
- [Hugo](https://gohugo.io/)
- Hugo Theme: [Docsy](https://www.docsy.dev/)
- Docker
- AWS
- Infrastructure:  [Terraform](https://www.terraform.io/)
- CI/CD:  [Github Actions](https://github.com/features/actions)

## Dev

```bash
docker run --rm -it -v $(pwd):/src -p 1313:1313 klakegg/hugo:0.83.1-ext-alpine shell
```
