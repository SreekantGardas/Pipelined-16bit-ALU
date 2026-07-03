import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('sim_data.csv')

plt.figure(figsize=(12, 6))

plt.step(df['time'], df['outfinal'], where='post', label='outfinal', color='blue', linewidth=1.5)

plt.step(df['time'], df['stall'] * 20000, where='post', label='stall (pulse)', color='red', linestyle='--')

plt.title('Pipelined ALU Hazard Analysis')
plt.xlabel('Simulation Time (ps)')
plt.ylabel('Signal Magnitude')
plt.legend(loc='upper right')
plt.grid(True, which='both', linestyle='--', alpha=0.7)

plt.tight_layout()
plt.savefig('pipeline_plot.png', dpi=300) # Saves as a high-quality image for your report
plt.show()