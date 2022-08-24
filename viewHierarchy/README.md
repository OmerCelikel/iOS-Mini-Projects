# Sıralama 
 ## Uygulama açıldığında:

loadView ilk sırada ancak sadece print("") olunca siyah ekran verdi


2 -loadViewIfNeeded

3 -viewDidLoad

4 -viewWillAppear

5 -viewDidLayoutSubviews

6 -viewDidAppear


 ## İkinci ekranı açınca:

5 -viewDidLayoutSubviews

7 -viewWillDisappear

5 -viewDidLayoutSubviews


 ## İkinci ekrandan ilk ekrana geçince:


4 -viewWillAppear

2 -loadViewIfNeeded

5 -viewDidLayoutSubviews

6 -viewDidAppear

8 -viewDidDisappear
