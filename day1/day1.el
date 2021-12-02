(require 'dash)

(defun buffer-lines (buffer)
  (let ((data))
    (save-excursion
      (goto-char (point-min))
      (with-current-buffer buffer
	(while (not (eobp))
	  (push
	   (buffer-substring-no-properties
	    (line-beginning-position)
	    (line-end-position))
	   data)
	  (forward-line 1))))
    (nreverse data)))

(defun compare (pair)
  (if (< (-first-item pair) (-last-item pair)) 1 0))

(defun solve-p1 (data)
  (--> (-map #'string-to-number data)
       (-partition-in-steps 2 1 it)
       (-map #'compare it)
       (-sum it)))

(solve-p1 (buffer-lines "*aoc-input*"))
