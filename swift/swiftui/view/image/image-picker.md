## ImagePicker

```swift
import SwiftUI
import Combine

final class ImagePicker: ObservableObject {
    static let shared: ImagePicker = ImagePicker()

    private init() {}

    let view = ImagePicker.View()
    let coordinator = ImagePicker.Coordinator()

    @Published var uiImage: UIImage? = nil
    @Published var image: Image? = nil
}


extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        // UIImagePickerControllerDelegate
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            ImagePicker.shared.uiImage = uiImage
            ImagePicker.shared.image = Image(uiImage: uiImage)
            picker.dismiss(animated:true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated:true)
        }
    }


    struct View: UIViewControllerRepresentable {
        func makeCoordinator() -> Coordinator {
            ImagePicker.shared.coordinator
        }

        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker.View>) -> UIImagePickerController {
            let picker = UIImagePickerController()
            picker.delegate = context.coordinator
            return picker
        }

        func updateUIViewController(_ uiViewController: UIImagePickerController,
                                    context: UIViewControllerRepresentableContext<ImagePicker.View>) {

        }
    }
}

#if DEBUG
struct ImagePickerTestView: View {
    @State var showingPicker = false
    @State var image: Image? = nil

    var body: some View {
        VStack {
            Button("Show image picker") {
                self.showingPicker = true
            }

            image?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)

        }.sheet(isPresented: $showingPicker,
                onDismiss: {
                    // do whatever you need here
                }, content: {
                    ImagePicker.shared.view
                })
        .onReceive(ImagePicker.shared.$image) { image in
            // This gets called when the image is picked.
            // sheet/onDismiss gets called when the picker completely leaves the screen
            self.image = image
        }
    }
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerTestView()
    }
}
#endif
```

[How to open the ImagePicker in SwiftUI?](https://stackoverflow.com/questions/56515871/how-to-open-the-imagepicker-in-swiftui/56516219)
