import sys
sys.stdin = open('input.txt')
from collections import deque

# 북, 동, 남, 서
dx = [-1, 0, 1, 0]
dy = [0, 1, 0, -1]


def bfs(r, c, d):
    queue = deque()
    queue.append((r, c, d))
    # 1. 현재 위치 청소
    data[r][c] = 2
    cnt = 1

    while queue:
        r, c, d = queue.popleft()

        for i in range(4):
            # 왼쪽 확인 후 전진 (0 > 3 > 2 > 1)
            nx = r + dx[(d+3)%4]
            ny = c + dy[(d+3)%4]
            d = (d+3) % 4

            if data[nx][ny] == 0:  # 2-a. 청소하지 않은 빈 공간이 존재하면
                data[nx][ny] = 2  # 청소
                cnt += 1
                queue.append((nx, ny, d))
                break
            if i == 3:  # 갈 곳이 없으면
                # 한 칸 후진 (0 <> 2 / 1 <> 3)
                nx = r + dx[(d+2)%4]
                ny = c + dy[(d+2)%4]
                queue.append((nx, ny, d))

                if data[nx][ny] == 1:  # 뒤가 벽이면
                    return cnt


N, M = map(int, input().split())
r, c, d = map(int, input().split())
data = list(list(map(int, input().split())) for _ in range(N))

print(bfs(r, c, d))