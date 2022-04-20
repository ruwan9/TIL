import sys
sys.stdin = open('input.txt')
from collections import deque


def bfs():
    queue = deque()
    queue.append((1, 0))
    emo[1][0] = 0

    while queue:
        s, c = queue.popleft()
        # 화면에 있는 이모티콘을 복사해 클립보드에 저장
        if emo[s][s] == -1:
            emo[s][s] = emo[s][c] + 1
            queue.append((s, s))
        # 클립보드에 있는 이모티콘을 화면에 붙여넣기
        if s + c <= S and emo[s + c][c] == -1:
            emo[s + c][c] = emo[s][c] + 1
            queue.append((s + c, c))
        # 화면에 있는 이모티콘 중 하나를 삭제
        if s - 1 >= 0 and emo[s - 1][c] == -1:
            emo[s - 1][c] = emo[s][c] + 1
            queue.append((s - 1, c))


S = int(input())
# emo[화면에 있는 이모티콘][클립보드에 있는 이모티콘] = 걸린 시간
emo = [[-1] * (S + 1) for _ in range(S + 1)]

bfs()
# 클립보드가 비어있으면 붙여넣기 불가
ans = emo[S][1]
for i in range(1, S + 1):
    ans = min(ans, emo[S][i])

print(ans)