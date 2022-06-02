{self, ...} @ inputs: system: {
  ivy = import ./ivy inputs system;
  slate = import ./slate inputs system;
}
