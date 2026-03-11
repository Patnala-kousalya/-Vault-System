#!/bin/sh

echo "Installing dependencies..."
npm install

echo "Compiling contracts..."
npx hardhat compile

echo "Deploying vault contract..."
npx hardhat run scripts/deploy.js