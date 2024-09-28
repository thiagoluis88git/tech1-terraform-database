# Tech1 - Terraform repository files - RDS Database (Postgres)

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Description](#description)
- [How to use](#how-to-use)
- [Infrastructure resources](#infrastructure-resources)
 - [Creating the database in RDS](#creating-the-database-in-rds)
 - [EC2 User Data](#ec2-user-data)

## Description

The Tech Challenge 1 aims to do a solution for a Fast Food restaurant. This project is part of the entire solution. Here we have all the `Terraform` files to create the **RDS Database infrastructure** to the `AWS` cloud.

## How to use

To build the infractructure, just run the `Github Actions manual Workflow (Build Infrastructure)` on `Actions` tab. This will take some time (between 24 to 28 minutes). To destroy the infractructure, just run the `Github Actions manual Workflow (Destroy Infrastructure)` on `Actions` tab. This will take some time (between 8 to 14 minutes).

## Infrastructure resources

The RDS Database infrastructure will be created by this project. The core resources are:

- RDS
- EC2 to connect in RDS private subnet

### Creating the database in RDS

The `Database name` creation is not part of the Infrastructure and must be done manually. To do this, we have to connect to the **RDS Postgres** to create the Database name. The **RDS** is part of the `Private subnet` and does not have external IP to be connected with. So, to connect to the **RDS** we have to build a `EC2` inside the **Private subnet** and only this **EC2** will have to `Security group` allowed to connect to the **RDS**. With this **EC2 instace** we now can connect to the **RDS Postgres** to create the **Database**.

### EC2 User Data

The `EC2 image` does not have some programs to connect to a `Postgres Database`, such as `psql`. To make it transparant to the **Developer** we use `EC2 User Data` to make an automation when the **EC2** instance finishes its creation. The `user_data.sh` have all the necessary programs to be installed within the instance to connect to the **RDS Postgres**.