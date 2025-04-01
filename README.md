# elunic DevOps Assessment

## Overview

You have been provided with
- a server IP
- a private SSH key

You can use it to login as `root` to the server via port `22` using the private SSH key.

## Rules

1. You can install everything you need to fullfil your tasks (some tools may already be installed, others may not)
2. You CAN (and probably should) connect any number of terminals you might need in parallel via ssh
3. You CAN (and probably should) use any number of tools you might need
4. You MAY NOT modify the Terraform code or the Kubernetes manifests that deploys the initial cluster, since it deploys in a way that sets up some of the tasks - BUT if the initial deployement fails, feel free to debug and fix it.

## Dockershell

A shell script `./shell` is provided in the root directory that sets up a predefined Docker-based shell environment with all necessary CLI tools pre-installed in the correct versions.

## Tasks

### Task 1

Deploy the Terraform stack in the `terraform` directory to create a KIND cluster on the target machine. Deploy the stack via SSH from your local machine. Debug any issues that might come up.

You now have the following environment:

1. the actual host-machine running linux - for cluster-external connections into kubernetes
2. and a 4-node KIND cluster running each of the kubernetes nodes as a docker container

You can restart the node-containers and work with them in any way you deem necessary.

The same is true for the host-machine itself. Again, you can install any tool you are missing and configure the machine in any way you see necessary to achieve the assignments below. Once you are done with the challenge, please properly exit all the sessions and close all the terminals you have been using.

You should use docker to connect into individual cluster-nodes running as containers - as you might have to run commands from inside the cluster but as a cluster node. Connecting to a pod inside the podCIDR of the cluster should work via kubectl commands as usual.

### Task 2

Create a user account for yourself on the host-machine

   1. make sure the UID and GID are 1010
   2. make sure a primary group with the same name is created for the account
   3. use the bash shell upon login for the user
   4. use /home for the data of the account
   5. make sure your user can run sudo without the need of a password
   6. make sure your user can open a remote ssh-session via the public ssh-key you provided


### Task 3

Ensure that your personal user account can run kubectl commandsTest it against the KIND cluster-context "kind-elunic-challenge" on the host machine

### Task 4

In the namespace "t1", you will find the deployment "task-1" with pods in a crash loop.Your task is to identify and fix the problems until the deployment "task-1" has two healthy replicas.

### Task 5

In the namespace "t2", you will find the deployment "task-2".
   1. your task is to deploy a pod of your choice in the default namespace
   2. with the label "role=http-client"
   3. and ensure that you have an HTTP client (e.g., curl) installed.
   4. enter your newly created pod
   5. and access the service "task-2" HTTP endpoint in the namespace "t2" (HTTP GET).

It will not work, and you must identify and fix all problems preventing traffic flow.

### Task 6

Start by creating the namespace "t3". Create a daemonset with the following settings:

   1. Name: task-3
   2. Namespace: t3
   3. Image: stefanprodan/podinfo:1.3.2
   4. Labels:
      - app=task-3
      - workload=daemonset
   5. Emptydir volume named my-data mounted to /data
   6. Run on worker node 3 only.
   7. Guaranteed resources of 75m CPU and 128Mi RAM

### Task 7

Start by creating the namespace "t4". Create a new RBAC role binding that applies only to the namespace "t4" with the following values set:

   - Name: task-4-rb
   - Role: "view"
   - Users: bob, alice

### Task 8

Start by creating the namespace "t5". Deploy a new pod with the following characteristic:

   - Image: gini/echochamber:latest
   - Name: echochamber
   - Container mode: privileged (to ease your debugging experience)
   - Don't change the entry point or command arguments

### Task 9

The echoChamber binary will write a secret message to an undisclosed location in the pod.

- Use your debugging skills to identify the file location and what the hidden message is.
