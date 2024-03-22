# terraform-vsphere
If you use vcenter as a cloud, and need to create several vms, you can use this terraform as a template, this code can create several clones.
The branch clone_ovf use an image from content library.
Some "data" blocks are mandatory to use otherwise terraform will throw an error. For further details read terraform docs. Wish you luck!
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
