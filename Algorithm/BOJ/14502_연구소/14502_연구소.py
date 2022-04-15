import sys
sys.stdin = open('input.txt')
from collections import deque


def bfs():
    global ans
    queue = deque()
    # 방문처리
    visited = [[-1]*M for _ in range(N)]

    for i in range(N):
        for j in range(M):
            #
            if arr[i][j] == 2:
                queue.append((i, j))
                visited[i][j] = 0

    while queue:
        x, y = queue.popleft()
        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]

            if 0 <= nx < N and 0 <= ny < M:
                # 빈칸이고, 방문하지 않았으면
                if arr[nx][ny] == 0 and visited[nx][ny] == -1:
                    queue.append((nx, ny))
                    visited[nx][ny] = 0

    # 영역 크기 구하기
    tmp = 0
    for i in range(N):
        for j in range(M):
            if arr[i][j] == 0 and visited[i][j] == -1:
                tmp += 1

    # 영역의 최대 크기
    ans = max(ans, tmp)


def wall(cnt):
    # 벽은 3개 세운다. - 이때 bfs 돌리기
    if cnt == 3:
        bfs()
        return

    for i in range(N):
        for j in range(M):
            # 빈칸이면 벽 세우기
            if arr[i][j] == 0:
                arr[i][j] = 1
                wall(cnt + 1)
                arr[i][j] = 0


N, M = map(int, input().split())
arr = [list(map(int, input().split())) for _ in range(N)]
ans = 0

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

wall(0)
print(ans)