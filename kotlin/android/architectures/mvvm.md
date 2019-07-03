## MVVM

```kotlin
override fun onStart() {
    super.onStart()
    // Modelから通知されるイベントを翻訳してViewに伝える
    registerDisposable(userModel.userUpdatedEvent.subscribe {
        progressDialog.dismiss()
        idErrorMessage.set("")
        userId.set(it.id)
        dismissDialogEventSubject.onNext(Unit)
    }, userModel.unauthorisedEvent.subscribe {
        progressDialog.dismiss()
        idErrorMessage.set(userIdErrorMessage)
    }, userModel.error.subscribe {
        progressDialog.dismiss()
        snackbarFactory?.create(R.string.message_error_network)?.show()
    })
}

override fun onResume() {
    super.onResume()
    userId.set(userModel.user.id)
}

fun onClickSetUp(view: View) {
    progressDialog.show()
    userModel.setUpUserId(userId.get())
}
```

[KotlinとDataBindingとMVVMとか](https://rei19.hatenablog.com/entry/2017/04/07/173435)
