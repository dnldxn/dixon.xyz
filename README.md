# dixon.xyz

The code for my personal site, built with Hugo, AWS, Docker, and Terraform.

This was a quick weekend project to refresh my existing site.

## Technologies Used

|  |  |
| --- | --- |
| [Hugo](https://gohugo.io/) | Popular static site generator |
| [Docsy](https://www.docsy.dev/) | The Hugo theme for the site |
| [Docker](https://www.docker.com/) | To create a clean, reproducible development environment locally |
| [AWS S3](https://aws.amazon.com/s3/) | S3 bucket to store and serve the static site |
| [Terraform](https://www.terraform.io/) | To define and setup the infrastructure |
| [Github Actions](https://github.com/features/actions) | CI/CD deployment pipeline |
| [CloudFlare](https://www.cloudflare.com/) | CDN and HTTPS redirect |

## Dev

```bash
docker run --rm -it -v $(pwd):/src -p 1313:1313 klakegg/hugo:0.89.4-ext-alpine shell
```

## Deploy Site

- Setup and authenticate the AWS CLI
- Create CloudFlare API token from the web UI.  Give the token the least amount of permission:
    - **Token name**: Terraform
    - **Permissions**:  `Zone:DNS:Edit`, `Zone:Page Rules:Edit`
    - **Zone Resources**:  `Include:Specific zone:YOUR DOMAIN`
    - **Client IP Address Filtering**:  `Is in:YOUR IP ADDRESS`
    - **TTL**:  `TODAY -> TOMORROW`
- Setup ENV variables for Cloudflare API token value
    - CLOUDFLARE_API_TOKEN
