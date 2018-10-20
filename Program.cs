using Microsoft.Quantum.Simulation.Simulators;
using System.Linq;

namespace Quantum.Effort {
    class Program {
        static void Main(string[] args) {

            var zerosQubits = 0;
            var OnesQubits  = 0;
            using (var sim = new QuantumSimulator()) {

                for (int iter = 0; iter < 5; iter++) {
                    var result = QubitsStatistics.Run(sim, true).Result;

                    System.Console.WriteLine(result);

                    if (result) {
                        OnesQubits++;
                    } else {
                        zerosQubits++;
                    }
                }
            }
            System.Console.WriteLine($"0 is: {zerosQubits}, 1 is: {OnesQubits}");
            System.Console.WriteLine("\n\nPress Enter to continue...\n\n");
            System.Console.ReadLine();
        }
    }
}
