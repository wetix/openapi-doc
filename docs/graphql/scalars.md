---
sidebar_label: "Scalars"
sidebar_position: 6
---

# Scalars

Scalars are primitive values: **Int**, **Float**, **String**, **Boolean**, or **ID**.

When calling the GraphQL API, you must specify nested subfields until you return only scalars.

## [Key](/docs/graphql/scalars#key)

Represents a **Base64 encoded string** that is a unique identifier of an object.

---

## [String](/docs/graphql/scalars#string)

Represents a textual data as **UTF-8** character sequences.

---

## [Boolean](/docs/graphql/scalars#boolean)

Represents **true** or **false** values.

---

## [Float](/docs/graphql/scalars#float)

Represents a **signed decimal** value.

---

## [Int](/docs/graphql/scalars#int)

Represents a **signed integer** that is at most 32 bits in size.

---

## [Int64](/docs/graphql/scalars#int64)

Represents a **signed integer** that is at most 64 bits in size.

---

## [Uint](/docs/graphql/scalars#uint)

Represents an **unsigned integer** that is at most 32 bits in size.

---

## [Uint64](/docs/graphql/scalars#uint64)

Represents an **unsigned integer** that is at most 64 bits in size.

---

## [Money](/docs/graphql/scalars#money)

Represents a **signed double-precision** which follow the format of **0.00**. Ex: 123.53.

---

## [URI](/docs/graphql/scalars#uri)

An **RFC3986**, **RFC3987**, and **RFC6570** (level 4) compliant URI string.

---

## [Date](/docs/graphql/scalars#date)

An [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date string, using the format of **YYYY-MM-DD**. Ex: 2006-06-22.

---

## [DateTime](/docs/graphql/scalars#datetime)

An **RFC3339** UTC date time string. Ex: 2019-10-12T07:20:50.52Z.

---

## [State](/docs/graphql/scalars#state)

An [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2:MY) state code string. Ex: **MY-14** for **Kuala Lumpur**.

---

## [Country](/docs/graphql/scalars#country)

An [ISO 3166-1 alpha-3](https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes) country code string. Ex: **MYS** for **Malaysia**.

---

## [Language](/docs/graphql/scalars#language)

A [BCP 47](https://appmakers.dev/bcp-47-language-codes-list/) language tag string. Ex: **en** for **English**. 

The possible values that this type may have are as following:

| Value   | Description |
| ------- | ----------- |
| `ms`    | Malay       |
| `ta`    | Tamil       |
| `ko`    | Korean      |
| `ja`    | Japanese    |
| `te`    | Telugu      |
| `th`    | Thai        |
| `hi`    | Hindi       |
| `zh`    | Chinese     |
| `zh-hk` | Cantonese   |
| `de`    | German      |
| `fr`    | French      |
| `id`    | Indonesian  |
| `vi`    | Vietnamese  |
| `ar`    | Arabic      |
| `bn`    | Bangladesh  |
| `tr`    | Turkish     |

---
