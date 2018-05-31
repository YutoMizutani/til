## selenium sample

seleniumを使ってgithub上のリポジトリをダウンロードするサンプル。
time.sleepで待つのは最も愚かだ、とか書いてあるけど気にしない。

```python
# -*- coding: utf-8 -*-

from selenium import webdriver
# from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
# from selenium.webdriver.support.ui import Select
from time import sleep

class Main:
    driver_path = "C:\selenium\chromedriver"

    def __configure_driver(self):
        self.driver = webdriver.Chrome(self.driver_path)
        self.driver.implicitly_wait(30)

    def __init__(self):
        self.__configure_driver()
        self.github()

    def github(self):
        # open github
        self.url = "https://github.com/"
        self.__access(self.url)
        self.__take_screenshot("open-github")
        # click hamberger
        self.button = self.driver.find_element_by_xpath("//button[contains(@class, 'btn-link d-lg-none mt-1 js-details-target')]")
        self.button.click()
        self.__take_screenshot("click-hamberger")
        # input form
        self.search_field = self.driver.find_element_by_xpath("//input[contains(@class, 'form-control header-search-input  js-site-search-focus')]")
        self.search_field.send_keys("getdoi")
        self.search_field.send_keys(Keys.ENTER)
        self.__take_screenshot("input-form")
        # move ym repo
        self.a = self.driver.find_element_by_xpath("//a[contains(@href, 'YutoMizutani')]")
        self.a.click()
        self.__take_screenshot("move-ym-repo")
        # open summary
        self.summary = self.driver.find_element_by_xpath("//summary[contains(@class, 'btn btn-sm btn-primary')]")
        self.summary.click()
        self.__take_screenshot("open-dl-summary")
        # get zip
        self.a = self.driver.find_element_by_xpath("//a[contains(@href, 'master.zip')]")
        self.a.click()
        self.__take_screenshot("get-zip")
        # quit
        sleep(5)
        self.__quit()

    def __access(self, url: str):
        self.driver.get(url)

    def __quit(self):
        self.driver.close()
        self.driver.quit()

    def __take_screenshot(self, name: str):
        self.driver.save_screenshot("./pic/" + name + ".png")

if __name__ == "__main__":
    main = Main()
```

[selenium webdriverを使ってWebページを自動操作する](https://qiita.com/KI1208/items/976b423c8e5f86a69e29)
[【Python】Seleniumの使用方法メモ](https://qiita.com/motoki1990/items/a59a09c5966ce52128be)
[【windows7】pythonでChromeのブラウザ操作を自動化 　～Selenium WebDriverを利用](https://qiita.com/ynishimura0922/items/a3332b5beb394248e44e)
[](https://kurozumi.github.io/selenium-python/locating-elements.html)
[](https://torina.top/detail/264/)
