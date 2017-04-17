public extension Comparable {
  public func clamp(min: Self, max: Self) -> Self {
    return Swift.max(min, Swift.min(max, self))
  }
}

public func clamp<T: Comparable>(value: T, min: T, max: T) -> T {
  return value.clamp(min: min, max: max)
}
