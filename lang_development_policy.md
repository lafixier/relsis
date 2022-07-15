## 概要

- 静的型付け
- とりあえずスクリプト言語
- 面倒なことは relsis にやらせよう的なライトな使用向き
- Nim, Python, Go, Rust-like

## 文法

- 丁寧
- 親切
- 明白
- 簡潔
- 自明

### 例

```python
main()

def main := fn (): int {
    def result:int = add(1, 2)
    print(result)
    ret 0
}

def add := fn (x:int, y:int): int {
    ret x + y
}
```

### 変数

#### 定義

```python
# 再代入と値の変更がともに不可能な変数(標準的な変数)を定義
# def <変数名>:<型名> = <値>
def a:int = 1

# 再代入は可能、値の変更が不可能な変数を定義
# def!asg <変数名>:<型名> = <値> 
def!asg b:int = 1

# 再代入は不可能、値の変更が可能な変数を定義
# def!mut <変数名>:<型名> = <値>
def!mut b:int = 1

# 再代入可能、値の変更が不可能な変数を定義
# def!agnmut <変数名>:<型名> = <値> 
def!asgmut b:int = 1

```

#### 再定義

```python
def a:int = 1
def a:int = 2 # 同一スコープ内において定義された変数の再定義は不可能なので、エラーを吐く
```

#### 再代入

```python
# 数値の場合
def!asg a:int = 1
a = 2

# リストの場合
def!mut b:list<int> = [1, 2, 3]
b = [3, 2, 1]

# 辞書の場合
def!mut c:dict<str:int> = {"x": 1, "y": 2}
c = {"a": 2, "b": 1}
```

### 値の変更

```python
# リストの場合
def!mut a:list<int> = [1, 2, 3]
a[0] = 3

# 辞書の場合
def!mut b:dict<str:int> = {"x": 1, "y": 2}
b.x = 3
```

## 条件分岐

### if

```python
def a := 1 + 1
if a == 1 {
    print("1 + 1 = 1")
} elif a == 2 {
    print("1 + 1 = 2")
} else {
    print("1 + 1 = ?")
}
```

### switch

```python
def role := "admin"
def message = switch role {
    case "admin" {
        ret "Hello, Admin!"
    }
    case "user" {
        ret "You are just a user."
    }
    default {
        ret "Who are you?"
    }
}
```

