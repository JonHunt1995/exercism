def encode(string):
    if not string:
        return string

    result = []
    curr = string[0]
    count = 0

    for letter in string:
        if letter != curr:
            result.append(f"{count if count > 1 else ''}{curr}")
            curr = letter
            count = 1
        else:
            count += 1
            
    result.append(f"{count if count > 1 else ''}{curr}")
        
    return ''.join(result)


    


def decode(string):
    result = []
    count = []
    
    for letter in string:
        if letter.isdigit():
            count.append(letter)
            continue
        result.append((int(''.join(count)) if count else 1) * letter)
        count = []

    return ''.join(result)
