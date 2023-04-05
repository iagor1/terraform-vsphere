# terraform-vsphere
If you use vcenter as a cloud, and need to create several vms, you can use terraform, e copy this code, this code uses vsphere provider
setup the variables such as datastore, datacenter, host, cluster, network etc. All this variables is mandatory to clone a vm from a template or create vm from
ovf/content_library.
All you need to do is install terraform, a vcenter datastore, datacenter, host, cluster, network and a vm that you can transform in template.
# Steps to run 
- Install terraform
- Change the variables to your setup environment
- Clone this repo and inside the folder run the commands

```
terraform init
```

```
terraform plan
```

```
terraform apply
```

```
terraform destroy
```

## That is just one way, the another way is : 

```
terraform init
```

```
terraform plan -out tfplan
```


```
terraform apply "tfplan"
```

```
terraform plan -destroy -out tfplan
```

```
terraform apply "tfplan"
```
this last way, terraform will create the tfplan file, and will follow this plan to do changes applys deletes etc
