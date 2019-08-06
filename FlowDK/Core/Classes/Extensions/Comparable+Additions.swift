public extension Comparable {
  func clamped(min: Self, max: Self) -> Self {
    return Swift.max(min, Swift.min(max, self))
  }
}

public func clamp<T: Comparable>(value: T, min: T, max: T) -> T {
  return value.clamped(min: min, max: max)
}
