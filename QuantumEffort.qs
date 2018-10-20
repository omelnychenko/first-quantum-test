namespace Quantum.Effort {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Set(necessary : Result, q : Qubit) : () {
        body {
            // Make quantum superposition
            let currQubit = q;

            H(q);

            // Measure state of the current qubit
            if (M(currQubit) == Zero) {
                // Use not-gate
                X(q);
            }
        }
    }

    operation QubitsStatistics(msg : Bool) : Bool {
        body {
            mutable measurement = false;

            using (qubits = Qubit[1]) {

                // One by default
                Set(One, qubits[0]);

                if (M(qubits[0]) != Zero) {
                    set measurement = true;
                }

                // Reset all of the qubits that we used before releasing them
                ResetAll(qubits);
            }
            return measurement;
        }
    }

}
