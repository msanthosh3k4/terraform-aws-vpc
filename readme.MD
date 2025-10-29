
---

## ⚙️ Mandatory Variables

> These variables **must be provided** either via `terraform.tfvars` or CLI `-var` flags.

| Variable | Description | Example | Required |
|-----------|--------------|----------|-----------|
| `project` | Project or app name used for tagging | `"expense"` | ✅ |
| `environment` | Environment name (e.g., dev, prod, staging) | `"dev"` | ✅ |
| `vpc_cidr_a` | CIDR block for Requester VPC | `"10.0.0.0/16"` | ✅ |
| `vpc_cidr_b` | CIDR block for Accepter VPC | `"10.1.0.0/16"` | ✅ |
| `public_subnet_cidrs` | List of 2 CIDR blocks for public subnets | `["10.0.1.0/24", "10.0.2.0/24"]` | ✅ |
| `azs` | List of Availability Zones for public subnets | `["ap-south-1a", "ap-south-1b"]` | ✅ |
| `aws_region` | AWS Region for deployment | `"ap-south-1"` | ✅ |

---

## 🧱 Optional Variables

| Variable | Description | Default |
|-----------|--------------|----------|
| `common_tags` | Map of common tags for all resources | `{ terraform = true }` |
| `auto_accept` | Whether to auto-accept VPC peering (same-account only) | `true` |

---

## 🧩 Key Components

| File | Purpose |
|------|----------|
| **`main.tf`** | Core infrastructure: VPCs, Subnets, Route Tables, Peering Connection |
| **`variables.tf`** | Input variables for configuration |
| **`locals.tf`** | Local computed values like naming and default tags |
| **`outputs.tf`** | Exports VPC IDs, Peering Connection IDs, Route Tables |
| **`terraform.tfvars`** | Stores actual variable values (optional but recommended) |

---

## 🪄 Example `terraform.tfvars`

```hcl
project      = "expense"
environment  = "dev"
vpc_cidr_a   = "10.0.0.0/16"
vpc_cidr_b   = "10.1.0.0/16"
azs          = ["ap-south-1a", "ap-south-1b"]
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
aws_region   = "ap-south-1"
