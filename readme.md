https://github.com/LucasHild/terraform-prometheus-grafana  (prometheus & grafana installation imp)


cmd's
terraform apply -auto-approve --> (so you don't need to enter yes)
terraform plan -refresh=false --> (this dose n't refresh the current giving faster response & reducing api calls- useful if   you have made a small change in only a single place)


aws eks --region ap-south-1 update-kubeconfig --name EKS-terraform --profile terraform
aws eks describe-cluster --name EKS-terraform --query "cluster.identity.oidc.issuer" --profile terraform

EKS CLUSTER CREATION STEPS

STEPS : 1
create a provider file 
you can write any provider you want & configure the credentials (using aws configure cmd)

STEPS : 2
create the vpc file ( in vpc file cidr_block instance_tenancy are essential ) 

STEPS : 3
Next create the internet-gateway (in internet-gateway mention the vpc-id i.e you will got from aws-vpc )

STEPS : 4
Next create the subnet (you will get the vpc-id from the subnet file)

STEPS : 5
Now create the elastic-ip 

STEPS : 6
Now create the nat gateway file

STEPS : 7
Now create the routing-table file & than create routing-table association file 

STEPS : 8
create the eks cluster file
-> first create the role & then attach the policy that you will create next
->



