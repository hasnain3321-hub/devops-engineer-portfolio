# DevOps Engineer Portfolio

Responsive static portfolio website, deployed with GitHub-triggered Jenkins CI/CD and Docker/Nginx.

## Local run

```bash
bash scripts/test.sh
docker compose -p devops-engineer-portfolio up -d --build
curl -I http://127.0.0.1:8082/
```

Open http://localhost:8082 in your browser.

## Pipeline

GitHub push → signed webhook receiver → Jenkins checkout → tests → Docker build → Docker deployment → health and HTTP verification.

Create a separate Jenkins Pipeline job using this repository's `Jenkinsfile`, and configure its webhook trigger. Do not reuse the old job's Docker container or port.

## Notes

This is a local deployment. The Cloudflare webhook tunnel does **not** make the portfolio website publicly hosted. Update contact and project details before sharing on LinkedIn.
