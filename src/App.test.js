import { render, screen } from '@testing-library/react';
import App from './App';

test('renders copyright link link', () => {
  render(<App />);
  const linkElement = screen.getByText(/Wow 123/i);
  expect(linkElement).toBeInTheDocument();
});
