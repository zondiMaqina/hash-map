# Hash Map Data Strcuture

A data strcuture where data is organised as a key-value pair, and is manipulated using its keys
This data structure uses an internal array (buckets)

- For each value, instead of a nested array `[[key, value], [key, value]]` I will be using nodes `Node.new(key, value`

## Manipulation

- Insertion => insert using key (key -> hash code -> bucket location)
- Deletion => Not sure yet
- Access => Use a key to get value needed (values correspond with keys)

## Time complexity

- Insertion => mostly O(1) complexity
- Access => mostly O(n) complexity
