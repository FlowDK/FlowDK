
enum LoadingState: Int {
  case initial, loading, loaded, failed, cancelled
}

class Loader: NSObject {
  weak var loaderSet: LoaderSet?
  var state: LoadingState = .initial {
    didSet {
      loaderSet?.loaderDidChange(loader: self)
    }
  }

  // Convenience
  func remove() {
    loaderSet?.removeLoader(self)
  }
}

class LoaderSet {
  private var loaders = [Loader]()

  // Callbacks
  var didChange: ((LoaderSet)->())?
  var loaderDidChange: ((Loader)->())?

  // Calculated
  var loadingCount: Int {
    var total = 0
    for loader in loaders {
      if loader.state == .loading {
        total += 1
      }
    }
    return total
  }

  var isLoading: Bool {
    return loadingCount > 0
  }

  var isAllLoaded: Bool {
    for loader in loaders {
      if loader.state != .loaded {
        return false
      }
    }
    return true
  }

  // Factory
  // Triggers did change
  func addLoader() -> Loader {
    let loader = Loader()
    loaders.append(loader)
    loader.loaderSet = self

    didChange?(self)
    return loader
  }

  // Triggers did change
  @discardableResult
  func removeLoader(_ loader: Loader) -> Loader {
    if let index = loaders.index(of: loader) {
      let loader = loaders.remove(at: index)
      if loader.state == .loading {
        loader.state = .cancelled
      }
      loader.loaderSet = nil

      didChange?(self)
    }
    return loader
  }

  func loaderDidChange(loader: Loader) {
    loaderDidChange?(loader)
  }
}
