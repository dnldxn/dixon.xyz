# dixon.xyz

The code for my personal site, built with Hugo, AWS, and Docker.

This was a quick weekend project to update my existing site.

## Technologies Used

|  |  |
| --- | --- |
| [Hugo](https://gohugo.io/) | Static site generator |
| [Docsy](https://www.docsy.dev/) | The Hugo theme for the site |
| [Docker](https://www.docker.com/) | To create a clean, reproducible development environment |
| [AWS S3](https://aws.amazon.com/s3/) | S3 bucket to store and serve the static site |
| [Terraform](https://www.terraform.io/) | To define and setup the infrastructure |
| [Github Actions](https://github.com/features/actions) | CI/CD deployment pipeline |
| [CloudFlare](https://www.cloudflare.com/) | CDN |

## Dev

```bash
docker run --rm -it -v $(pwd):/src -p 1313:1313 klakegg/hugo:0.89.4-ext-alpine shell
```
