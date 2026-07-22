# Qeravon permissionless discovery experiment

![Qeravon logo](qeravon-logo.png)

This project isolates the permissionless wallet-discovery path without using
Flap or an upgradeable proxy.

## Token properties

- OpenZeppelin ERC-20 and EIP-2612 Permit
- Fixed supply minted once at deployment
- No owner or privileged administrator
- No later minting
- No tax, blacklist, pause, transfer gate, proxy, or upgrade mechanism
- Name and symbol selected at deployment

## Official visual identity

- Canonical repository logo: `qeravon-logo.png`
- Wallet icon: `outputs/qeravon-logo/logo.png`
- Master artwork: `outputs/qeravon-logo/qeravon-logo-master.png`
- Wallet format: transparent RGBA PNG, 256 x 256 pixels
- SHA-256: `cd52343d691baf1d42486e709e52d8e2357a4edf34beb8043968faa8935f599c`

This file is the canonical Qeravon logo for explorer, DEX, wallet, token-list,
and metadata submissions. Do not create separate visually different copies for
individual services.

## Verification gates

No mainnet liquidity should be increased until every preceding gate passes:

1. Contract tests pass and source code is verified.
2. A PancakeSwap Infinity pool against a recognized base asset is indexed by
   PancakeSwap itself.
3. PancakeSwap reports a contract-address-specific market price after a real
   buy and sell functionality check.
4. Target wallets are checked separately for balance, price, fiat value, and
   logo. These are independent fields and may arrive at different times.
5. If the initial small experiment is not discovered, stop. Do not buy holders,
   manufacture volume, or increase liquidity to chase an undocumented rule.

## Local verification

Install the pinned development dependencies after cloning:

```bash
forge install OpenZeppelin/openzeppelin-contracts@v5.6.0 --no-commit
forge install foundry-rs/forge-std@v1.12.0 --no-commit
```

```bash
forge test --offline -vv
```

## BNB Chain deployment

- Contract: `0x1bCdde9FC6B2f2d190A51A9f85c405Aa7E866f3E`
- Creation transaction: `0x16f5cfde852aeb92e756c6734d117266f3e517223b2b4607bb714e74eb3b06d6`
- Deployer and initial recipient: `0x1ca30BC967A88Fe925799f7c17803545d3acbE31`
- Name / symbol: `Qeravon (QRVN)`
- Decimals: `18`
- Fixed supply: `1,000,000 QRVN`
- Gas used: `996,542` at `0.05 gwei` (`0.0000498271 BNB`)
- Source verification: Sourcify exact creation and runtime match; BscScan exact match

The contract has no owner, proxy, upgrade, tax, blacklist, pause, transfer
gate, or post-deployment mint function. The complete supply was minted once to
the initial recipient.

The BscScan standard-input artifact is available at
`outputs/Qeravon-BscScan-Standard-Input.json`.
