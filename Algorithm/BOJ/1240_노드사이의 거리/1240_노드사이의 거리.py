import sys
sys.stdin = open('input.txt')
from collections import deque


def bfs(start, end):
    queue = deque()
    queue.append((start, 0))

    visited = [0] * (N+1)
    visited[start] = 1

    while queue:
        v, d = queue.popleft()
        # 종료 조건
        if v == end:
            return d
        # 방문하지 않았으면 방문 처리 후 거리 추가
        for w, r in data[v]:
            if visited[w] == 0:
                visited[w] = 1
                queue.append((w, r+d))


N, M = map(int, input().split())
data= [[] for _ in range(N+1)]

# 시작점, 종료점과 함께 거리를 받아 저장.
for _ in range(N-1):
    s, e, r = map(int, input().split())
    data[s].append((e, r))
    data[e].append((s, r))

for _ in range(M):
    start, end = map(int, input().split())
    print(bfs(start, end))

