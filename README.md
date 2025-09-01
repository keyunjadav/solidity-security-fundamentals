# Solidity Security Fundamentals (Intermediate+)

A curated lab of **famous Web3 smart contract vulnerabilities** with intentionally vulnerable contracts, **secure fixes**, and **exploit PoCs**.

## Vulnerabilities covered
- Reentrancy
- Integer overflow/underflow (historical; shown via `unchecked`)
- Front‑running / MEV (predictable randomness + naive DEX price)
- Access control flaws (missing onlyOwner / function selector collision)
- `delegatecall` misuse (untrusted library clobbering storage)
- `tx.origin` authentication
- Denial of Service (DoS) via unexpected revert + gas griefing on payout loops
- Selfdestruct misuse
- Approval phishing / allowance race
- Oracle manipulation / flashloan-style price attacks (simplified)

## Structure
```
contracts/
  vulnerable/
  secure/
scripts/exploits/
test/
```

> ⚠️ For education only. Use responsibly.
