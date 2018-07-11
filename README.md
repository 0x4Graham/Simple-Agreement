# Simple-Agreement

A simple contract simulating a finacial agreement 
## Getting Started
These instructions will provide the steps required to get the contract up and running quickly. 


### Prerequisites

Install Truffle

```
npm install -g truffle
```

Install Http-Server

```
npm install http-server -g
```

## Running the contract

1. Remove the Build folder. 

2. Navigate to the folder path and run the development truffle blockchain. Truffle has a built in blockchain. 

```
truffle develop
```

3. Migrate the contract to the network

```
migrate
```

3. Take the deployed contract address (visible in the console after step 3.) and update Index.html file at line 26. 
```
  Counter: 0x345ca3e014aaf5dca488057592ee47305d9b3e10
```

Index.html: Line 26
```
var contract_address = "0x345ca3e014aaf5dca488057592ee47305d9b3e10";
```

4. Run http-server

```
http-server
```

5. Navigate to address provided by http-server output. 

6. Interact with contract


## Other Notes

If the contract is changed/edited, you will need to update the contract ABI. The contract ABI can be found in the build folder created when migrate is run. Copy the ABI and save it to the ABI.js file. 
