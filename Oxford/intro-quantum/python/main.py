# Source - https://stackoverflow.com/a/63539077
# Posted by Patrick FitzGerald, modified by community. See post 'Timeline' for change history
# Retrieved 2026-04-01, License - CC BY-SA 4.0

import numpy as np                 # v 1.19.2
import matplotlib.pyplot as plt    # v 3.3.2
import matplotlib.patches as patches

# FIND THE GRID POINTS
pos_x = []
r2 = np.sqrt(2)
for i in range(0, 7):
    for j in range(0, 7):
        if i - j * r2 <= 1 and i - j *r2 >= -1 and i + j*r2 <= 5:
            pos_x.append(i + j * r2)
x_li = [i for i in pos_x]
for i in pos_x:
    x_li.append(-i)


pos_x2 = []
x_li2 = []

for i in range(0, 7):
    for j in range(0, 7):
        if i - j * r2 - r2/2 <= 1 and i - j *r2 - r2/2 >= -1 and i + j*r2 + r2/2  <= 5:
            pos_x2.append(i + j * r2 + r2/2)

x_li2 = [i for i in pos_x2]
for i in pos_x2:
    x_li2.append(-i)



# Enter x and y coordinates of points and colors

# Select length of axes and the space between tick labels
xmin, xmax, ymin, ymax = -5, 5, -5, 5
ticks_frequency = 1

# Plot points
fig, ax = plt.subplots(figsize=(10, 10))
for i in x_li:
    ax.scatter([i] * len(x_li), x_li, c='r')
for i in x_li2:
    ax.scatter([i] * len(x_li2), x_li2, c='r')

square = patches.Rectangle((-1, -1), 2, 2, facecolor='blue', alpha=0.3)
ax.add_patch(square)


# Set identical scales for both axes
ax.set(xlim=(xmin-1, xmax+1), ylim=(ymin-1, ymax+1), aspect='equal')

# Set bottom and left spines as x and y axes of coordinate system
ax.spines['bottom'].set_position('zero')
ax.spines['left'].set_position('zero')

# Remove top and right spines
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

# Create 'x' and 'y' labels placed at the end of the axes
ax.set_xlabel('x', size=20, labelpad=-24, x=1.03)
ax.set_ylabel('y', size=20, labelpad=-21, y=1.02, rotation=0)

# Create custom major ticks to determine position of tick labels
x_ticks = np.arange(xmin, xmax+1, ticks_frequency)
y_ticks = np.arange(ymin, ymax+1, ticks_frequency)
# increase label size
ax.set_xticks(x_ticks[x_ticks != 0])
ax.set_yticks(y_ticks[y_ticks != 0])
ax.tick_params(axis='both', which='major', labelsize=12)


# Create minor ticks placed at each integer to enable drawing of minor grid
# lines: note that this has no effect in this example with ticks_frequency=1
ax.set_xticks(np.arange(xmin, xmax+1), minor=True)
ax.set_yticks(np.arange(ymin, ymax+1), minor=True)

# Draw major and minor grid lines
ax.grid(which='both', color='grey', linewidth=1, linestyle='-', alpha=0.2)

# Draw arrows
arrow_fmt = dict(markersize=6, color='black', clip_on=False)
ax.plot((1), (0), marker='>', transform=ax.get_yaxis_transform(), **arrow_fmt)
ax.plot((0), (1), marker='^', transform=ax.get_xaxis_transform(), **arrow_fmt)

# tight layout often produces nice results 
plt.tight_layout()
plt.show()
plt.savefig("discrete-set.png")

