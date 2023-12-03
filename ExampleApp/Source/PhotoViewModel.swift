//
// Copyright (c) 2022 Nathan E. Walczak
//
// MIT License
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import UIKit

class PhotoViewModel {
    
    let photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    var name: String {
        photo.name
    }
    
    var image: UIImage {
        photo.image.image
    }
    
}

extension PhotoViewModel {
    
    static var examples: [PhotoViewModel] {
        let photos = [
            Photo(name: L.photoButton, image: .button),
            Photo(name: L.photoGreenPaperClip, image: .greenPaperClip),
            Photo(name: L.photoGreenPencil, image: .greenPencil),
            Photo(name: L.photoRedCup, image: .Red.cup),
            Photo(name: L.photoStapler, image: .Red.stapler),
            Photo(name: L.photoSilverPaperClip, image: .silverPaperClip),
            Photo(name: L.photoWhiteDice, image: .whiteDice)
        ]
        return photos.map(PhotoViewModel.init)
    }
    
}
