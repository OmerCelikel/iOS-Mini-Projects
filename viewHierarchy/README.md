# Sıralama 
 ## Uygulama açıldığında:

loadView ilk sırada ancak sadece print("") olunca siyah ekran verdi


First page 2 -loadViewIfNeeded

First page 3 -viewDidLoad

First page 4 -viewWillAppear

First page 5 -viewDidLayoutSubviews

First page 6 -viewDidAppear


 ## İkinci ekranı açınca:

First page 5 -viewDidLayoutSubviews

Second page 3 -viewDidLoad

First page 7 -viewWillDisappear

Second page 4 -viewWillAppear

Second page 2 -loadViewIfNeeded

Second page 5 -viewDidLayoutSubviews

First page 5 -viewDidLayoutSubviews

First page 8 -viewDidDisappear

Second page 6 -viewDidAppear


 ## İkinci ekrandan ilk ekrana geçince:

Second page 7 -viewWillDisappear

First page 4 -viewWillAppear

First page 2 -loadViewIfNeeded

First page 5 -viewDidLayoutSubviews

Second page 8 -viewDidDisappear

First page 6 -viewDidAppear

