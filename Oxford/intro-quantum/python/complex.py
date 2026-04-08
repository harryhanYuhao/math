import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import Arc, FancyArrowPatch

# ----------------------------
# Geometry parameters
# ----------------------------
alpha = np.deg2rad(35)   # angle of the upper point on the unit circle
r = 1.0

P = np.array([np.cos(alpha), np.sin(alpha)])   # upper point on circle
Q = np.array([0.0, -1.0])                      # bottom point on circle

# Chord direction and normal
d = P - Q
d = d / np.linalg.norm(d)
n = np.array([d[1], -d[0]])  # one normal direction

# Offset line for the "epsilon^2/2" annotation
eps_shift = 0.54
Q2 = Q + eps_shift * n
P2 = P + eps_shift * n

# A point on the interior diagonal from the origin
z_end = np.array([np.cos(alpha), -np.sin(alpha)])

# ----------------------------
# Figure setup
# ----------------------------
fig, ax = plt.subplots(figsize=(10, 8), dpi=160)
ax.set_aspect("equal")
ax.set_xlim(-1.35, 1.75)
ax.set_ylim(-1.2, 1.2)
ax.axis("off")

axis_color = "0.55"
circle_color = "0.5"

# ----------------------------
# Axes with arrows
# ----------------------------
ax.add_patch(FancyArrowPatch(
    (-1.25, 0), (1.62, 0),
    arrowstyle='->', mutation_scale=18,
    linewidth=1.2, color=axis_color
))
ax.add_patch(FancyArrowPatch(
    (0, -1.12), (0, 1.13),
    arrowstyle='->', mutation_scale=18,
    linewidth=1.2, color=axis_color
))

# Axis label
ax.text(-0.05, 1.03, r"$i$", fontsize=28, color=axis_color,
        ha="right", va="bottom")

# ----------------------------
# Unit circle
# ----------------------------
t = np.linspace(0, 2*np.pi, 600)
ax.plot(r*np.cos(t), r*np.sin(t), color=circle_color, lw=1.1)

# ----------------------------
# Filled circular segment region R_epsilon
#   region between the chord QP and the arc of the unit circle from Q to P
# ----------------------------
arc_t = np.linspace(-np.pi/2, alpha, 300)
arc_pts = np.c_[np.cos(arc_t), np.sin(arc_t)]
segment_pts = np.vstack([Q, P, arc_pts[::-1]])  # chord + arc
ax.fill(segment_pts[:, 0], segment_pts[:, 1],
        color="#cfcdfd", alpha=0.7, zorder=2)

# Chord boundary
ax.plot([Q[0], P[0]], [Q[1], P[1]], color="black", lw=1.3, zorder=3)

# ----------------------------
# Interior diagonal from origin (z-vector)
# ----------------------------
ax.plot([0, z_end[0]], [0, z_end[1]], color="black", lw=1.2, zorder=3)
ax.add_patch(FancyArrowPatch(
    (0.0, 0.0), (z_end[0], z_end[1]),
    arrowstyle='->', mutation_scale=14,
    linewidth=1.2, color="black"
))

# z label
ax.text(0.84, -0.73, r"$\vec{z}$", fontsize=24)

# ----------------------------
# Parallel offset line and epsilon^2/2 annotation
# ----------------------------
ax.plot([Q2[0], P2[0]], [Q2[1], P2[1]], color="black", lw=1.2, zorder=3)

# Small dimension line between the two parallel lines
mid1 = P + 0.03 * n
mid2 = P2 + 0.03 * n
ax.add_patch(FancyArrowPatch(
    (mid1[0], mid1[1]), (mid2[0], mid2[1]),
    arrowstyle='<->', mutation_scale=16,
    linewidth=1.0, color="black"
))
ax.text(1.03, 0.65, r"$\dfrac{\epsilon^2}{2}$", fontsize=20)

# "1" label near the x-axis / right side
ax.text(1.03, 0.08, r"$1$", fontsize=26, color="0.45")

# ----------------------------
# Angle arc and label theta/2
# ----------------------------
angle_arc = Arc((0, 0), width=0.9, height=0.9,
                angle=0, theta2=0, theta1=-np.rad2deg(alpha),
                lw=1.1, color="black")
ax.add_patch(angle_arc)
ax.text(0.28, -0.16, r"$\dfrac{\theta}{2}$", fontsize=20)

# ----------------------------
# Region label
# ----------------------------
ax.text(0.45, -0.38, r"$R_\epsilon$", fontsize=30)

# Optional label inside the circle
ax.text(-0.45, 0.38, r"$\overline{D}$", fontsize=32, color="0.55")

plt.tight_layout()
plt.savefig("complex.png")
