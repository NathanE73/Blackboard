## Dequeue Collection View Cell Usage

Scans through storyboards.

### Xcode Editor Autocomplete

![Autocomplete Dequeue Collection View Cell](Images/AutocompleteDequeueCollectionViewCell.png)

### Storyboard Identifier

![Photo Collection View Cell](Images/StoryboardPhotoCollectionViewCell.png)

### Backboard Generated Code

[Photo.blackboard.swift](/ExampleApp/Source/Generated/Photo.blackboard.swift)

```swift
final func dequeuePhotoCell(from collectionView: UICollectionView, for indexPath: IndexPath,
                            initialize: ((_ photoCell: PhotoCollectionViewCell) -> Void)? = nil) -> PhotoCollectionViewCell
```

### The Blackboard Way

[ExampleApp](/ExampleApp/Source/PhotosCollectionViewController.swift#L37)
```swift
override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let photoViewModel = photoViewModels[indexPath.item]
    return dequeuePhotoCell(from: collectionView, for: indexPath) { cell in
        cell.imageView.image = photoViewModel.image
    }
}
```

### The Standard UIKit Way

[StandardApp](/StandardApp/Source/PhotosCollectionViewController.swift#L46)
```swift
override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let photoViewModel = photoViewModels[indexPath.item]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Photo", for: indexPath) as! PhotoCollectionViewCell
    cell.imageView.image = photoViewModel.image
    return cell
}
```
