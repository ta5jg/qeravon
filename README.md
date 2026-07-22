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
- Public logo URL: `https://raw.githubusercontent.com/ta5jg/qeravon/main/qeravon-logo.png`
- Canonical metadata: `token-metadata.json`

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

## PancakeSwap V2 market

- Pair: `0xC429b0Fd4761A267D24279Bb22ef90200E2C17aC`
- Assets: QRVN / WBNB
- Initial reserves: `1,000 QRVN / 0.025 BNB`
- Initial price: `0.000025 BNB` per QRVN
- Liquidity transaction: `0xc286d4fdaf1f64037a2cc8d0c78c96418acf85bf3727b7bd8f3ecd2e1ea690f3`
- LP recipient: `0x1ca30BC967A88Fe925799f7c17803545d3acbE31`

The pair received two external buys six seconds after creation:

- `0xc7a315d33b868c591099cace248d026ae89ad4879ea70de2094f8afa46ff6ade`:
  `0.0001 BNB` for `3.974143168756661 QRVN`
- `0xc28fe30528c7db4f55eb12c5925f5a1e307696aea5d0b735a9f4cbc2bda429c6`:
  `0.000198 BNB` for `7.776264372848418 QRVN`

These transactions provide on-chain evidence that the permissionless market
path discovered and traded the new pair immediately after creation.
