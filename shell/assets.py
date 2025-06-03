"""
修改资源文件:
一键修改资源文件名、文件夹名为随机字符串,同时修改资源文件哈希
"""

import os
import random
import string
import shutil

def recursion_dir_list(dir):
    """
    递归文件夹内所有的文件夹

    return {name}: {文件夹名称}
    """

    names = []
    path_list: list[str] = os.listdir(dir)
    for name in path_list:
        if name.startswith('.'):
            continue
        fullpath = os.path.join(dir, name)
        if os.path.isdir(fullpath):
            names.append(name)
            names += recursion_dir_list(fullpath)
            
    return set(names)

def recursion_dirpath_list(dir):
    """
    递归文件夹内所有的文件夹

    return [文件夹路径]
    """

    dirs = []
    path_list: list[str] = os.listdir(dir)
    for name in path_list:
        if name.startswith('.'):
            continue
        fullpath = os.path.join(dir, name)
        if os.path.isdir(fullpath):
            dirs.append(fullpath)
            dirs += recursion_dir_list(fullpath)
            
    return dirs


def recursion_file_list(dir):
    """
    递归文件夹内所有的文件

    return [fullpath]: [完整路劲]
    """

    files = []
    path_list: list[str] = os.listdir(dir)
    for name in path_list:
        if name.startswith('.'):
            continue
        fullpath = os.path.join(dir, name)
        if os.path.isdir(fullpath):
            files += recursion_file_list(fullpath)
        else:
            files.append(fullpath)
            
    return files
 
def generate_random_string(length):
    """
    生成随机字符串

    return str: 随机字符串
    """

    letters = string.ascii_letters  # 包含所有字母的字符串
    random_string = ''.join(random.choice(letters) for _ in range(length))
    return random_string

def fileAppend(filename: str):
    chars = random.sample(string.ascii_uppercase, 1)
    myfile = open(filename, 'a')
    myfile.write(chars[0])
    myfile.close
    print(f"修改{filename} ... 完成")

def start_md5_process(path: str, filter: str):
    file_list = os.listdir(path)
    for file in file_list: 
        if file.startswith('.'):
            continue
        full_path = path + '/' + file
        if os.path.isdir(full_path):
            start_md5_process(full_path, filter)
        else:
            if full_path.endswith(filter):
                try:
                    fileAppend(full_path)
                except IOError:
                    continue


def start_task(project_dir):
    """
    开始任务
    """

    assets_dir = os.path.join(project_dir, 'assets')
    lib_dir = os.path.join(project_dir, 'lib')

    dir_name_dict = {}
    names, dirs = recursion_dir_list(assets_dir), recursion_dirpath_list(assets_dir)
    for name in names:
        dir_name_dict[name] = generate_random_string(8)

    new_file_list: list[str] = []
    file_list: list[str] = recursion_file_list(assets_dir)
    for sub_file in file_list:
        old_path: str = os.path.abspath(sub_file)

        new_path = old_path
        dir_path: str = os.path.dirname(old_path).replace(assets_dir, '')
        subdirs = dir_path.split(os.sep) if os.sep in dir_path else []
        for old_dir in subdirs:
            new_dir = dir_name_dict.get(old_dir)
            if new_dir:
                new_path = old_path.replace(f'{os.sep}{old_dir}{os.sep}', f'{os.sep}{new_dir}{os.sep}')

        split_dir, split_name = os.path.split(new_path)
        file_name, file_extension = split_name.split(".")
        new_path = new_path.replace(split_name, f'{generate_random_string(12)}.{file_extension}')
        os.makedirs(split_dir, exist_ok=True)
        shutil.move(old_path, new_path)
        print(f"{old_path} -> {new_path}")
        new_file_list.append(new_path)
    [shutil.rmtree(dir, ignore_errors=True) for dir in dirs]
    old_asset_list = [e.replace(project_dir+os.sep, '') for e in file_list]
    new_asset_list = [e.replace(project_dir+os.sep, '') for e in new_file_list]

    lib_file_list = recursion_file_list(lib_dir)
    for lib_file in lib_file_list:
        lib_file_path: str = os.path.abspath(lib_file)
        try:
            with open(lib_file_path, 'r', encoding="utf-8") as old_file:
                content = old_file.read()
                for old_asset, new_asset in zip(old_asset_list, new_asset_list):
                    content = content.replace(old_asset, new_asset)
                    with open(lib_file_path, 'w', encoding="utf-8") as new_file:
                        new_file.write(content)
                    print(f"{lib_file_path}: {old_asset} -> {new_asset}")
        except FileNotFoundError:
            print(f"Error: {lib_file_path} does not exist.")
        except Exception as e:
            print(f"An error occurred: {e}")

if __name__ == '__main__':
    print('start ...')

    project_dir = input('请输入项目绝对路径: ').strip()
    start_task(project_dir)

    filter = ('.png', '.jpg', '.jpeg', '.wav', '.mp3', '.webp')
    start_md5_process(project_dir, filter)

    print("end ...")