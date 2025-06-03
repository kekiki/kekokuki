"""
创建工程:
所有文件和文件夹都是新创建的,读取老项目文件内容写入新文件
"""

import os

def create_project_from_old(old_dir, new_dir):
    """
    把一个文件夹内的所有文件创建到新文件夹内
    """

    file_list = recursion_file_list(old_dir)
    for sub_file in file_list:
        old_path: str = os.path.abspath(sub_file)
        new_path = old_path.replace(old_dir, new_dir)
        split_dir = os.path.split(new_path)
        os.makedirs(split_dir[0], exist_ok=True)
        copy_file_content(sub_file, new_path)

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

def copy_file_content(old_file_path, new_file_path):
    """
    拷贝文件内容
    """
    
    try:
        with open(old_file_path, 'rb') as old_file:
            content = old_file.read()
        with open(new_file_path, 'wb') as new_file:
            new_file.write(content)
        print(f"Content copied from {old_file_path} to {new_file_path}")
    except FileNotFoundError:
        print(f"Error: {old_file_path} does not exist.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == '__main__':
    print('start')

    # Example
    # old_project = '/Users/wh1462/Desktop/workspace/kekokuki_live_base'
    # new_project = '/Users/wh1462/Desktop/workspace/kekokuki'
    old_project = input('请输入旧项目绝对路径: ').strip()
    new_project = input('请输入旧项目绝对路径: ').strip()
    create_project_from_old(old_project, new_project)

